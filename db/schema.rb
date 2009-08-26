# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090820010451) do

  create_table "cores", :force => true do |t|
    t.string   "descricao",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cores_pedido_produtos", :force => true do |t|
    t.integer "pedido_produto_id"
    t.integer "cor_id"
  end

  add_index "cores_pedido_produtos", ["pedido_produto_id"], :name => "pedido_produto"

  create_table "cores_produtos", :id => false, :force => true do |t|
    t.integer "cor_id"
    t.integer "produto_id"
  end

  add_index "cores_produtos", ["cor_id", "produto_id"], :name => "produto_por_cor", :unique => true

  create_table "pedidos", :force => true do |t|
    t.integer  "numero",     :limit => 8
    t.string   "cliente"
    t.text     "observacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pedidos_produtos", :force => true do |t|
    t.integer  "pedido_id"
    t.integer  "produto_id"
    t.integer  "cor_id"
    t.string   "tamanho",    :limit => 2
    t.float    "quantidade"
    t.string   "observacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produtos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quantidade_tamanhos", :force => true do |t|
    t.integer  "cor_pedido_produto_id"
    t.string   "tamanho",               :limit => 2, :null => false
    t.integer  "quantidade",                         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quantidade_tamanhos", ["cor_pedido_produto_id", "tamanho"], :name => "quantidade_tamanhos_unicos", :unique => true

end
