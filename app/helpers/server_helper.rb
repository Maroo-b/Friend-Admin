module ServerHelper
  def display_by_line(array_items)
    simple_format(array_items.join("\n"))
  end
end
