# frozen_string_literal: true

class SortSelectorsComponent < ViewComponent::Base
  def initialize(model:, sort:, order:)
    @model = model
    @sort = sort
    @order = order
  end

  def options_for_sort_select
    options_for_select(@model.options_for_sort_select, @sort)
  end

  def options_for_sort_order
    options_for_select([["Ascending", "asc"],
                       ["Descending", "desc"]
                       ], @order)
  end
end
