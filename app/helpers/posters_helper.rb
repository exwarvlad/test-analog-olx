module PostersHelper
  # помошник для отображения списка доступных типов объявлений
  def select_helper_poster_type(array_type)
    arra = []

    array_type.each do |elem|
      new_array = []
      new_array.push(elem, elem)

      arra << new_array
    end
  end
end
