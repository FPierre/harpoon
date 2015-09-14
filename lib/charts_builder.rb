class ChartsBuilder
  def self.format_for_pie_chart(*inputs)
    ap inputs
    data = Array.new

    inputs.each do |inputs|
      data << { value: options[:value], color: options[:color], label: key, highlight: options[:highlight] }
    end
ap data
    data
  end
end
