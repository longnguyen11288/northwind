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

ActiveRecord::Schema.define(:version => 20130606215914) do

  create_table "Categories", :primary_key => "CategoryID", :force => true do |t|
    t.string "CategoryName", :limit => 15, :null => false
    t.text   "Description"
    t.text   "Picture"
  end

  add_index "Categories", ["CategoryName"], :name => "CategoryName"

  create_table "CustomerCustomerDemo", :id => false, :force => true do |t|
    t.string "CustomerID",     :limit => 5,  :null => false
    t.string "CustomerTypeID", :limit => 10, :null => false
  end

  create_table "CustomerDemographics", :id => false, :force => true do |t|
    t.string "CustomerTypeID", :limit => 10, :null => false
    t.text   "CustomerDesc"
  end

  create_table "Customers", :id => false, :force => true do |t|
    t.string "CustomerID",   :limit => 5,  :null => false
    t.string "CompanyName",  :limit => 40, :null => false
    t.string "ContactName",  :limit => 30
    t.string "ContactTitle", :limit => 30
    t.string "Address",      :limit => 60
    t.string "City",         :limit => 15
    t.string "Region",       :limit => 15
    t.string "PostalCode",   :limit => 10
    t.string "Country",      :limit => 15
    t.string "Phone",        :limit => 24
    t.string "Fax",          :limit => 24
  end

  add_index "Customers", ["City"], :name => "City"
  add_index "Customers", ["CompanyName"], :name => "CompanyName"
  add_index "Customers", ["PostalCode"], :name => "PostalCode"
  add_index "Customers", ["Region"], :name => "Region"

  create_table "EmployeeTerritories", :id => false, :force => true do |t|
    t.integer "EmployeeID",                :null => false
    t.string  "TerritoryID", :limit => 20, :null => false
  end

  create_table "Employees", :force => true do |t|
    t.string   "LastName",        :limit => 20, :null => false
    t.string   "FirstName",       :limit => 10, :null => false
    t.string   "Title",           :limit => 30
    t.string   "TitleOfCourtesy", :limit => 25
    t.datetime "BirthDate"
    t.datetime "HireDate"
    t.string   "Address",         :limit => 60
    t.string   "City",            :limit => 15
    t.string   "Region",          :limit => 15
    t.string   "PostalCode",      :limit => 10
    t.string   "Country",         :limit => 15
    t.string   "HomePhone",       :limit => 24
    t.string   "Extension",       :limit => 4
    t.text     "Photo"
    t.text     "Notes"
    t.integer  "ReportsTo"
    t.string   "PhotoPath"
  end

  add_index "Employees", ["LastName"], :name => "LastName"
  add_index "Employees", ["PostalCode"], :name => "PostalCode"

  create_table "Order Details", :id => false, :force => true do |t|
    t.integer "OrderID",                                  :null => false
    t.integer "ProductID",                                :null => false
    t.decimal "UnitPrice",               :default => 0.0, :null => false
    t.integer "Quantity",  :limit => 2,  :default => 1,   :null => false
    t.float   "Discount",  :limit => 24, :default => 0.0, :null => false
  end

  add_index "Order Details", ["OrderID"], :name => "OrderID"
  add_index "Order Details", ["OrderID"], :name => "OrdersOrder_Details"
  add_index "Order Details", ["ProductID"], :name => "ProductID"
  add_index "Order Details", ["ProductID"], :name => "ProductsOrder_Details"

  create_table "Orders", :primary_key => "OrderID", :force => true do |t|
    t.string   "CustomerID",     :limit => 5
    t.integer  "EmployeeID"
    t.datetime "OrderDate"
    t.datetime "RequiredDate"
    t.datetime "ShippedDate"
    t.integer  "ShipVia"
    t.decimal  "Freight",                      :default => 0.0
    t.string   "ShipName",       :limit => 40
    t.string   "ShipAddress",    :limit => 60
    t.string   "ShipCity",       :limit => 15
    t.string   "ShipRegion",     :limit => 15
    t.string   "ShipPostalCode", :limit => 10
    t.string   "ShipCountry",    :limit => 15
  end

  add_index "Orders", ["CustomerID"], :name => "CustomerID"
  add_index "Orders", ["CustomerID"], :name => "CustomersOrders"
  add_index "Orders", ["EmployeeID"], :name => "EmployeeID"
  add_index "Orders", ["EmployeeID"], :name => "EmployeesOrders"
  add_index "Orders", ["OrderDate"], :name => "OrderDate"
  add_index "Orders", ["ShipPostalCode"], :name => "ShipPostalCode"
  add_index "Orders", ["ShipVia"], :name => "ShippersOrders"
  add_index "Orders", ["ShippedDate"], :name => "ShippedDate"

  create_table "Products", :primary_key => "ProductID", :force => true do |t|
    t.string  "ProductName",     :limit => 40,                    :null => false
    t.integer "SupplierID"
    t.integer "CategoryID"
    t.string  "QuantityPerUnit", :limit => 20
    t.decimal "UnitPrice",                     :default => 0.0
    t.integer "UnitsInStock",    :limit => 2,  :default => 0
    t.integer "UnitsOnOrder",    :limit => 2,  :default => 0
    t.integer "ReorderLevel",    :limit => 2,  :default => 0
    t.boolean "Discontinued",                  :default => false, :null => false
  end

  add_index "Products", ["CategoryID"], :name => "CategoriesProducts"
  add_index "Products", ["CategoryID"], :name => "CategoryID"
  add_index "Products", ["ProductName"], :name => "ProductName"
  add_index "Products", ["SupplierID"], :name => "SupplierID"
  add_index "Products", ["SupplierID"], :name => "SuppliersProducts"

  create_table "Region", :id => false, :force => true do |t|
    t.integer "RegionID",                        :null => false
    t.string  "RegionDescription", :limit => 50, :null => false
  end

  create_table "Shippers", :primary_key => "ShipperID", :force => true do |t|
    t.string "CompanyName", :limit => 40, :null => false
    t.string "Phone",       :limit => 24
  end

  create_table "Suppliers", :primary_key => "SupplierID", :force => true do |t|
    t.string "CompanyName",  :limit => 40, :null => false
    t.string "ContactName",  :limit => 30
    t.string "ContactTitle", :limit => 30
    t.string "Address",      :limit => 60
    t.string "City",         :limit => 15
    t.string "Region",       :limit => 15
    t.string "PostalCode",   :limit => 10
    t.string "Country",      :limit => 15
    t.string "Phone",        :limit => 24
    t.string "Fax",          :limit => 24
    t.text   "HomePage"
  end

  add_index "Suppliers", ["CompanyName"], :name => "CompanyName"
  add_index "Suppliers", ["PostalCode"], :name => "PostalCode"

  create_table "Territories", :id => false, :force => true do |t|
    t.string  "TerritoryID",          :limit => 20, :null => false
    t.string  "TerritoryDescription", :limit => 50, :null => false
    t.integer "RegionID",                           :null => false
  end

  create_table "stores", :force => true do |t|
    t.string   "owner"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
