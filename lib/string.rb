class String
  def convert_to_array
    gsub(" ", "").split(",").map { |x| x.to_i }
  end
end
