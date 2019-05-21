# Product.create!([
#   {name: "Abong Ballista Wooden Miniature Tabletop Desktop Warfare Kit", price: "17.0", image_url: "https://images-na.ssl-images-amazon.com/images/I/51drOT4eqZL.jpg", description: "Conquer your enemies from your desk with this easy assembly tabletop ballista!", quantity: 10, in_stock: nil},
#   {name: "Mr. Meeseeks plush", price: "10.0", image_url: "https://images-na.ssl-images-amazon.com/images/I/510zTk88ZxL._SL1001_.jpg", description: "LoOk At Me, I'm Mr. MeEsEeKs", quantity: 50, in_stock: nil},
#   {name: "Thronos", price: "15000.0", image_url: "https://s.aolcdn.com/hss/storage/midas/b59948b784ba2acec508c8b725ca9360/206626404/thronos-ed.jpg", description: "Ultimate gaming chair/station with RGB!!!", quantity: 1, in_stock: nil},
#   {name: "Gigabyte Aorus RTX 2080 TI 11GB graphics card", price: "1350.0", image_url: "https://c1.neweggimages.com/NeweggImage/ProductImageCompressAll1280/14-932-075-V01.jpg", description: "Super awesome graphics card with a built in AIO liquid cooler to make your gaming magical", quantity: 1, in_stock: nil},
#   {name: "Not a flamethrower", price: "1799.0", image_url: "https://i.ebayimg.com/images/g/K1UAAOSwhntbxidw/s-l1600.jpg", description: "It isn't a flamethrower...", quantity: 0, in_stock: true}
# ])


# supplier = Supplier.new({name: "Nvidia", email: "nvidia@nvidia.com", phone_number: "333-333-3333"})
# supplier.save 

# supplier = Supplier.new({name: "Amazon", email: "amazon@amazon.com", phone_number: "222-222-2222"})
# supplier.save 

# supplier = Supplier.new({name: "Rick", email: "rick@rick.com", phone_number: "111-111-1111"}) 
# supplier.save 

# Already made electronics
Category.create(name: "Random")
Category.create(name: "Weapons")
Category.create(name: "Entertainment")

# Eletrnics 
ProductCategory.create(category_id: 1, product_id: 1)
ProductCategory.create(category_id: 1, product_id: 5)

# Randoms 
ProductCategory.create(category_id: 2, product_id: 4)
ProductCategory.create(category_id: 2, product_id: 7)

# Weapons 
ProductCategory.create(category_id: 3, product_id: 3)
ProductCategory.create(category_id: 3, product_id: 2)
ProductCategory.create(category_id: 3, product_id: 7)

# Entertainment
ProductCategory.create(category_id: 4, product_id: 4)
