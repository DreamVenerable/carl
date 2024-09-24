# db/seeds.rb

# Clear existing data
Category.destroy_all
Engine.destroy_all
Fitment.destroy_all
Manufacturer.destroy_all
Origin.destroy_all
Part.destroy_all
Product.destroy_all
Variation.destroy_all
VehicleMake.destroy_all
VehicleModel.destroy_all
VehicleYear.destroy_all

# Create Categories
categories = 5.times.map do |i|
  Category.create!(
    name: "Category #{i+1}",
    ar_name: "فئة #{i+1}",
    image_path: "path/to/image_#{i+1}.jpg",
    sold_count: rand(1..100),
    in_stock_count: rand(1..50),
    added_date: DateTime.now
  )
end

# Create Manufacturers
manufacturers = 3.times.map do |i|
  Manufacturer.create!(
    name: "Manufacturer #{i+1}",
    ar_name: "المصنع #{i+1}",
    image_path: "path/to/manufacturer_image_#{i+1}.jpg"
  )
end

# Create Parts and Products
parts = categories.flat_map do |category|
  5.times.map do |j|
    part = Part.create!(
      name: "Part #{j+1}",
      ar_name: "جزء #{j+1}",
      category_id: category.id,
      image_path: "path/to/part_image_#{j+1}.jpg",
      added_date: DateTime.now
    )

    2.times.map do |k|
      product = Product.create!(
        part_number: "PN#{j+1}#{k+1}",
        oem_number: "OEM#{j+1}#{k+1}",
        part_id: part.id,
        manufacturer_id: manufacturers.sample.id,
        retail_price_lyd: rand(100..500),
        base_price_lyd: rand(50..250),
        base_price_usd: rand(50..250),
        retail_price_usd: rand(100..500),
        stock_quantity: rand(1..100),
        sold_quantity: rand(1..50),
        start_date_availability: DateTime.now,
        end_date_availability: DateTime.now + 1.year,
        is_external: [ true, false ].sample,
        shipping_days_from: rand(1..5),
        shipping_days_to: rand(6..10),
        status: "available",
        warranty: "1 year",
        universal_fit: [ true, false ].sample,
        image_path: "path/to/product_image_#{j+1}#{k+1}.jpg"
      )

      # Create variations for each product
      2.times do |l|
        Variation.create!(
          product_id: product.id,
          variation_name: "Variation #{l+1}",
          variation_value: "Value #{l+1}",
          variation_name_ar: "التغيير #{l+1}",
          variation_value_ar: "القيمة #{l+1}"
        )
      end
      product
    end
  end
end

# Create Vehicle Makes and Models
kia = VehicleMake.create!(make_name: "Kia", make_name_ar: "كيا")
models = [ 'Sorento', 'Sportage', 'Optima' ].map do |model_name|
  VehicleModel.create!(name_model: model_name, model_name_ar: model_name, vehicle_make_id: kia.id)
end

# Create Vehicle Years and Engines
years = models.flat_map do |model|
  3.times.map do |y|
    year = VehicleYear.create!(year: (2020 - y).to_s, vehicle_model_id: model.id)

    # Create Engines
    2.times.map do |engine_num|
      Engine.create!(
        engine_power: "Power #{engine_num + 1} HP",
        vehicle_model_id: model.id,
        vehicle_year_id: year.id,
        power_kw: rand(100..200),
        power_ps: rand(100..200),
        fuel_type: "Petrol"
      )
    end
    year
  end
end

# Create Origins
models.each do |model|
  2.times do |n|
    origin_sample = [ [ "Korea", "كوريا" ], [ "Canada", "كندا" ] ]
    Origin.create!(
      origin_name: origin_sample[n][0],
      origin_name_ar: origin_sample[n][1],
      vehicle_model_id: model.id
    )
  end
end

# Create Fitments
Product.all.each do |product|
  vehicle_models = VehicleModel.all.sample(2) # Randomly sample 2 vehicle models
  vehicle_models.each do |vehicle_model|
    vehicle_years = vehicle_model.vehicle_years.sample(1) # Randomly sample 1 year
    vehicle_years.each do |vehicle_year|
      engines = vehicle_year.engines.sample(2) # Randomly sample 2 engines for the year
      engines.each do |engine|
        origin = Origin.where(vehicle_model_id: vehicle_model.id).sample # Find an origin for the vehicle model

        Fitment.create!(
          product_id: product.id,
          vehicle_year_id: vehicle_year.id,
          vehicle_model_id: vehicle_model.id,
          engine_id: engine.id,
          origin_id: origin.id
        )
      end
    end
  end
end

puts "Seeding Complete!"
