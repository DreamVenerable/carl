# db/seeds.rb

# Clear existing records
# Category.destroy_all
# Manufacturer.destroy_all
# Part.destroy_all
# Product.destroy_all
# Variation.destroy_all
# VehicleMake.destroy_all
# VehicleModel.destroy_all
# VehicleYear.destroy_all
# Engine.destroy_all
# Origin.destroy_all
# Fitment.destroy_all

# Seed Categories
category1 = Category.create(name: 'Engine Parts', ar_name: 'قطع غيار المحرك', image_path: 'engine_parts.png', sold_count: 0, in_stock_count: 100, added_date: DateTime.now)
category2 = Category.create(name: 'Body Parts', ar_name: 'قطع غيار الجسم', image_path: 'body_parts.png', sold_count: 0, in_stock_count: 50, added_date: DateTime.now)

# Seed Manufacturers
manufacturer1 = Manufacturer.create(name: 'ACME Corp', ar_name: 'شركة أكمي', image_path: 'acme.png')
manufacturer2 = Manufacturer.create(name: 'Beta Industries', ar_name: 'صناعات بيتا', image_path: 'beta.png')

# Seed Vehicle Makes
make1 = VehicleMake.create(make_name: 'Toyota', make_name_ar: 'تويوتا')
make2 = VehicleMake.create(make_name: 'Ford', make_name_ar: 'فورد')

# Seed Vehicle Models
model1 = VehicleModel.create(name_model: 'Camry', model_name_ar: 'كامري', vehicle_make: make1)
model2 = VehicleModel.create(name_model: 'Mustang', model_name_ar: 'موستانغ', vehicle_make: make2)

# Seed Vehicle Years
year1 = VehicleYear.create(year: '2020', vehicle_model: model1)
year2 = VehicleYear.create(year: '2021', vehicle_model: model2)

# Seed Parts
part1 = Part.create(name: 'Oil Filter', ar_name: 'فلتر الزيت', image_path: 'oil_filter.png', added_date: DateTime.now, category_id: category1.id)
part2 = Part.create(name: 'Brake Pad', ar_name: 'وسادة الفرامل', image_path: 'brake_pad.png', added_date: DateTime.now, category_id: category2.id)

# Seed Products
product1 = Product.create(part_number: 'P1234', oem_number: 'OEM1234', part_id: part1.id, manufacturer_id: manufacturer1.id,
                          retail_price_lyd: 50.0, base_price_lyd: 30.0, base_price_usd: 20.0,
                          retail_price_usd: 35.0, stock_quantity: 100, sold_quantity: 10,
                          start_date_availability: DateTime.now, end_date_availability: nil,
                          is_external: false, shipping_days_from: 1, shipping_days_to: 3,
                          status: 'available', warranty: '1 year', universal_fit: true, image_path: 'oil_filter_product.png')

product2 = Product.create(part_number: 'P5678', oem_number: 'OEM5678', part_id: part2.id, manufacturer_id: manufacturer2.id,
                          retail_price_lyd: 75.0, base_price_lyd: 55.0, base_price_usd: 40.0,
                          retail_price_usd: 60.0, stock_quantity: 50, sold_quantity: 5,
                          start_date_availability: DateTime.now, end_date_availability: nil,
                          is_external: false, shipping_days_from: 2, shipping_days_to: 5,
                          status: 'available', warranty: '6 months', universal_fit: false, image_path: 'brake_pad_product.png')

# Seed Variations
variation1 = Variation.create(product_id: product1.id, variation_name: 'Size', variation_value: 'Small', variation_name_ar: 'حجم', variation_value_ar: 'صغير')
variation2 = Variation.create(product_id: product2.id, variation_name: 'Color', variation_value: 'Red', variation_name_ar: 'لون', variation_value_ar: 'أحمر')

# Seed Engines
engine1 = Engine.create(engine_power: '200 HP', vehicle_model_id: model1.id, vehicle_year_id: year1.id, power_kw: 147, power_ps: 200, fuel_type: 'Petrol')
engine2 = Engine.create(engine_power: '300 HP', vehicle_model_id: model2.id, vehicle_year_id: year2.id, power_kw: 221, power_ps: 300, fuel_type: 'Petrol')

# Seed Origins
origin1 = Origin.create(origin_name: 'Japan', origin_name_ar: 'اليابان', vehicle_model_id: model1.id)
origin2 = Origin.create(origin_name: 'USA', origin_name_ar: 'الولايات المتحدة', vehicle_model_id: model2.id)

# Seed Fitments
Fitment.create(product_id: product1.id, vehicle_year_id: year1.id, vehicle_model_id: model1.id, engine_id: engine1.id)
Fitment.create(product_id: product2.id, vehicle_year_id: year2.id, vehicle_model_id: model2.id, engine_id: engine2.id)

puts "Seed data created successfully!"
