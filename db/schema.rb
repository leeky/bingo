# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121015234625) do

  create_table "card_sets", :force => true do |t|
    t.string   "name"
    t.integer  "font_id"
    t.integer  "quantity"
    t.integer  "columns"
    t.integer  "rows"
    t.integer  "ascii"
    t.integer  "theme_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fonts", :force => true do |t|
    t.string   "name"
    t.string   "typeface"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.boolean  "dingbat",    :default => true
  end

  create_table "fonts_themes", :force => true do |t|
    t.integer "theme_id"
    t.integer "font_id"
  end

  create_table "glyphs", :force => true do |t|
    t.string   "name"
    t.integer  "ascii"
    t.integer  "font_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pictures", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pictures_themes", :force => true do |t|
    t.integer "theme_id"
    t.integer "picture_id"
  end

  create_table "themes", :force => true do |t|
    t.string   "name"
    t.integer  "font_id"
    t.integer  "picture_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
