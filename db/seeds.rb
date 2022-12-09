puts "Seeding database..."

# Farmers (FarmerID, Name, Address/town, Phone, password_digest)
Farmer.create!(name: "James Gordon", town: "Nakuru", phone: "254712345678", username: "scorpio", password: "poritors", password_confirmation: "poritors")
Farmer.create!(name: "Peter Ian", town: "Kiambu", phone: "254712543876", username: "jagten", password: "opponed", password_confirmation: "opponed")
Farmer.create!(name: "Kenneth Smith", town: "Meru", phone: "254710000000", username: "madmax", password: "baboundstably", password_confirmation: "baboundstably")
Farmer.create!(name: "Evans Brian", town: "Nyahururu", phone: "254718500000", username: "legolas", password: "adorts", password_confirmation: "adorts")

# Produce (ProduceID, Type, Quantity, UnitPrice, FarmerID)
Produce.create!(name: "Apples", quantity: 5, units: "kgs", unit_price: 50, farmer_id: 1)
Produce.create!(name: "Oranges", quantity: 7, units: "kgs", unit_price: 40, farmer_id: 3)
Produce.create!(name: "Maize", quantity: 100, units: "kgs", unit_price: 45, farmer_id: 2)
Produce.create!(name: "Tomatoes", quantity: 5, units: "kgs", unit_price: 20, farmer_id: 4)
Produce.create!(name: "Watermelon", quantity: 200, units: "kgs", unit_price: 80, farmer_id: 2)
Produce.create!(name: "Avocado", quantity: 120, units: "kgs", unit_price: 70, farmer_id: 1)
Produce.create!(name: "Beans", quantity: 50, units: "kgs", unit_price: 90, farmer_id: 4)
Produce.create!(name: "Chilli", quantity: 60, units: "kgs", unit_price: 105, farmer_id: 3)

# Consumers (ConsumerID, Name, Address/town, Phone, password_digest)
Consumer.create!(name: "James Isaacs", town: "Kitengela", phone: "25411222333", username: "thejoker", password: "mation", password_confirmation: "mation")
Consumer.create!(name: "Michael Brown", town: "Rongai", phone: "25410200000", username: "ednamode", password: "conitiones", password_confirmation: "conitiones")
Consumer.create!(name: "Anderson Junior", town: "Ruai", phone: "254700000100", username: "thesting", password: "gradjumbed", password_confirmation: "gradjumbed")
Consumer.create!(name: "Moses Kevin", town: "Thika", phone: "25411144555", username: "batman", password: "chafoor", password_confirmation: "chafoor")

# SalePurchases (SalePurchaseID, ConsumerID, ProduceID)
SalePurchase.create!(consumer_id: 2, produce_id: 1)
SalePurchase.create!(consumer_id: 1, produce_id: 8)
SalePurchase.create!(consumer_id: 4, produce_id: 7)
SalePurchase.create!(consumer_id: 3, produce_id: 3)
SalePurchase.create!(consumer_id: 2, produce_id: 2)
SalePurchase.create!(consumer_id: 3, produce_id: 5)
SalePurchase.create!(consumer_id: 4, produce_id: 4)
SalePurchase.create!(consumer_id: 1, produce_id: 6)

puts "Seeding done!"