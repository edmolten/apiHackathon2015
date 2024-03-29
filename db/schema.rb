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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151010004030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clases", force: true do |t|
    t.string  "title"
    t.boolean "isADomicilio"
    t.boolean "isDesignadoPorTutor"
    t.integer "price"
    t.integer "user_id"
    t.integer "tema_id"
    t.text    "description"
    t.text    "disponibilidad"
    t.string  "nivel"
    t.boolean "activa"
    t.float   "lat"
    t.float   "long"
    t.text    "contacto"
  end

  create_table "temas", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string "email"
    t.string "name"
    t.text   "password_digest"
    t.text   "remember_digest"
    t.float  "valoracion"
    t.text   "about"
  end

end
