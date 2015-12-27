class PostDetails < ActiveRecord::Migration
  def change
	  create_table "posts", force: :cascade do |t|
	    t.string   "title"
	    t.text     "description"
	    t.string   "brand"
	    t.string   "model"
	    t.integer  "price"
	    t.datetime "created_at",          null: false
	    t.datetime "updated_at",          null: false
	    t.string   "image_file_name"
	    t.string   "image_content_type"
	    t.integer  "image_file_size"
	    t.datetime "image_updated_at"
	    t.integer  "user_id"
	    t.string   "year"
	    t.string   "condition"
	    t.string   "location"
	    t.string   "shipping"
	    t.string   "movement"
	    t.string   "case"
	    t.string   "bracelet"
	    t.string   "dial"
	    t.text     "functions"
	    t.string   "availability"
	    t.string   "image2_file_name"
	    t.string   "image2_content_type"
	    t.integer  "image2_file_size"
	    t.datetime "image2_updated_at"
	    t.string   "image3_file_name"
	    t.string   "image3_content_type"
	    t.integer  "image3_file_size"
	    t.datetime "image3_updated_at"
	  end

	  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

	  create_table "users", force: :cascade do |t|
	    t.string   "email",                  default: "", null: false
	    t.string   "encrypted_password",     default: "", null: false
	    t.string   "reset_password_token"
	    t.datetime "reset_password_sent_at"
	    t.datetime "remember_created_at"
	    t.integer  "sign_in_count",          default: 0,  null: false
	    t.datetime "current_sign_in_at"
	    t.datetime "last_sign_in_at"
	    t.string   "current_sign_in_ip"
	    t.string   "last_sign_in_ip"
	    t.datetime "created_at",                          null: false
	    t.datetime "updated_at",                          null: false
	  end

	  add_index "users", ["email"], name: "index_users_on_email", unique: true
      add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
end
