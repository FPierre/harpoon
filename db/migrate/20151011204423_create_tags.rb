class CreateTags < ActiveRecord::Migration
  def change
    # create_table :categories do |t|
    #   t.string :name
    # end

    # create_table :tags do |t|
    #   t.string :name
    # end

    # add_reference :tags, :category, index: true
    # add_foreign_key :tags, :categories

    categories = [
      { name: 'ruby',            tags: ['ruby on rails', 'rails', 'active record'] },
      { name: 'devops',          tags: ['devops', 'docker'] },
      { name: 'javascript',      tags: ['js', 'meteor', 'meteorjs'] },
      { name: 'linux mint',      tags: ['mint'] },
      { name: 'elasticsearch',   tags: ['elastic', 'elk', 'kibana', 'logstash'] },
      { name: 'material design', tags: ['material', 'flat design'] }
    ]

    categories.each do |category|
      current_category = Category.create!(name: category[:name])

      category[:tags].each do |tag|
        Tag.create!(name: tag, category: current_category)
      end
    end
  end
end
