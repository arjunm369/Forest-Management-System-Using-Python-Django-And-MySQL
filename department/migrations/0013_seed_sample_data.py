from django.db import migrations


def seed_sample_data(apps, schema_editor):
    """Seed the database with sample forest management data."""
    
    Forest = apps.get_model('department', 'forest')
    Flora = apps.get_model('department', 'flora')
    Fauna = apps.get_model('department', 'fauna')
    News = apps.get_model('department', 'news')
    AwarenessProgram = apps.get_model('department', 'awareness_program')
    Category = apps.get_model('department', 'category')
    Product = apps.get_model('department', 'product')
    
    # Create forests
    forests_data = [
        {
            'name': 'Western Ghats Reserve',
            'area': '5000 sq km',
            'district': 'Kozhikode',
            'location': 'Northern Kerala',
            'attraction': 'Biodiversity hotspot with rare species',
            'website': 'ghats.gov.in'
        },
        {
            'name': 'Amazon Basin',
            'area': '8000 sq km',
            'district': 'Amazonas',
            'location': 'South America',
            'attraction': 'World\'s largest rainforest ecosystem',
            'website': 'amazon.gov.br'
        },
        {
            'name': 'Boreal Forest',
            'area': '12000 sq km',
            'district': 'Northern Region',
            'location': 'Canada & Russia',
            'attraction': 'Largest terrestrial biome',
            'website': 'boreal.gov.ca'
        },
    ]
    
    forests = []
    for data in forests_data:
        forest, _ = Forest.objects.get_or_create(name=data['name'], defaults=data)
        forests.append(forest)
    
    # Create flora entries
    flora_data = [
        {
            'forest': forests[0],
            'name': 'Teak Tree',
            'botanical': 'Tectona grandis',
            'habitat': 'Deciduous forests',
            'vegetation': 'Hardwood species',
            'description': 'Valuable timber tree resistant to pests and diseases',
            'photo': 'teak.jpg'
        },
        {
            'forest': forests[0],
            'name': 'Rubber Tree',
            'botanical': 'Hevea brasiliensis',
            'habitat': 'Tropical rainforest',
            'vegetation': 'Commercial plantation',
            'description': 'Important source of natural rubber',
            'photo': 'rubber.jpg'
        },
        {
            'forest': forests[1],
            'name': 'Amazon Mahogany',
            'botanical': 'Swietenia macrophylla',
            'habitat': 'Tropical forest canopy',
            'vegetation': 'Hardwood tree',
            'description': 'Highly valued timber from the Amazon basin',
            'photo': 'mahogany.jpg'
        },
    ]
    
    for data in flora_data:
        Flora.objects.get_or_create(
            forest=data['forest'],
            name=data['name'],
            defaults={k: v for k, v in data.items() if k != 'forest' and k != 'name'}
        )
    
    # Create fauna entries
    fauna_data = [
        {
            'forest': forests[0],
            'name': 'Indian Elephant',
            'category': 'Mammal',
            'habitat': 'Dense forest zones',
            'description': 'Largest land animal in Asia, herbivorous and highly intelligent',
            'photo': 'elephant.jpg'
        },
        {
            'forest': forests[0],
            'name': 'Bengal Tiger',
            'category': 'Carnivore',
            'habitat': 'Forest patches and grasslands',
            'description': 'Endangered species, apex predator of Indian forests',
            'photo': 'tiger.jpg'
        },
        {
            'forest': forests[1],
            'name': 'Pink River Dolphin',
            'category': 'Mammal',
            'habitat': 'River systems',
            'description': 'Intelligent river dolphin, indicator of Amazon ecosystem health',
            'photo': 'dolphin.jpg'
        },
        {
            'forest': forests[2],
            'name': 'Gray Wolf',
            'category': 'Carnivore',
            'habitat': 'Boreal and taiga forests',
            'description': 'Pack predator essential for ecosystem balance',
            'photo': 'wolf.jpg'
        },
    ]
    
    for data in fauna_data:
        Fauna.objects.get_or_create(
            forest=data['forest'],
            name=data['name'],
            defaults={k: v for k, v in data.items() if k != 'forest' and k != 'name'}
        )
    
    # Create news
    news_data = [
        {
            'title': 'New Conservation Effort Launched',
            'date': '2024-01-15',
            'description': 'Government announces $50 million fund for rainforest protection in 2024'
        },
        {
            'title': 'Forest Coverage Increases by 5%',
            'date': '2024-02-20',
            'description': 'Annual report shows positive growth in global forest coverage'
        },
        {
            'title': 'Endemic Species Rediscovered',
            'date': '2024-03-10',
            'description': 'Rare species thought extinct found alive in protected reserve'
        },
    ]
    
    for data in news_data:
        News.objects.get_or_create(title=data['title'], defaults=data)
    
    # Create awareness programs
    program_data = [
        {
            'title': 'Forest Stewardship 101',
            'cname': 'Dr. Green Initiative',
            'date': '2024-04-15',
            'description': 'Educational program for sustainable forest management practices'
        },
        {
            'title': 'Climate Action Through Reforestation',
            'cname': 'Environmental Coalition',
            'date': '2024-05-20',
            'description': 'Community-driven tree planting and ecosystem restoration campaign'
        },
        {
            'title': 'Wildlife Conservation Workshop',
            'cname': 'Wildlife Foundation',
            'date': '2024-06-10',
            'description': 'Training on endangered species protection and habitat preservation'
        },
    ]
    
    for data in program_data:
        AwarenessProgram.objects.get_or_create(title=data['title'], defaults=data)
    
    # Create product categories
    categories_data = [
        'Timber & Wood Products',
        'Forest Fruits & Nuts',
        'Medicinal Plants',
        'Eco-friendly Crafts',
    ]
    
    categories = []
    for name in categories_data:
        cat, _ = Category.objects.get_or_create(category=name)
        categories.append(cat)
    
    # Create products
    product_data = [
        {
            'category': categories[0],
            'name': 'Premium Teak Wood',
            'uses': 'Furniture, decking, marine applications',
            'quantity': '500 units',
            'price': '5000',
            'image': 'teak_product.jpg'
        },
        {
            'category': categories[1],
            'name': 'Forest Honey',
            'uses': 'Natural sweetener, medicinal purposes',
            'quantity': '200 kg',
            'price': '500',
            'image': 'honey.jpg'
        },
        {
            'category': categories[1],
            'name': 'Cashew Nuts',
            'uses': 'Snack, cooking, oil extraction',
            'quantity': '300 kg',
            'price': '800',
            'image': 'cashew.jpg'
        },
        {
            'category': categories[2],
            'name': 'Medicinal Bark Extract',
            'uses': 'Herbal medicine, dietary supplement',
            'quantity': '100 liters',
            'price': '2000',
            'image': 'bark_extract.jpg'
        },
        {
            'category': categories[3],
            'name': 'Bamboo Crafts',
            'uses': 'Decorative items, household products',
            'quantity': '150 pieces',
            'price': '300',
            'image': 'bamboo_craft.jpg'
        },
    ]
    
    for data in product_data:
        Product.objects.get_or_create(
            name=data['name'],
            defaults=data
        )


def remove_sample_data(apps, schema_editor):
    """Remove sample data if migration is reversed."""
    Forest = apps.get_model('department', 'forest')
    News = apps.get_model('department', 'news')
    AwarenessProgram = apps.get_model('department', 'awareness_program')
    Category = apps.get_model('department', 'category')
    Product = apps.get_model('department', 'product')
    
    # Delete in order to respect foreign key constraints
    Forest.objects.filter(name__in=['Western Ghats Reserve', 'Amazon Basin', 'Boreal Forest']).delete()
    News.objects.filter(title__in=['New Conservation Effort Launched', 'Forest Coverage Increases by 5%', 'Endemic Species Rediscovered']).delete()
    AwarenessProgram.objects.filter(title__in=['Forest Stewardship 101', 'Climate Action Through Reforestation', 'Wildlife Conservation Workshop']).delete()
    Category.objects.filter(category__in=['Timber & Wood Products', 'Forest Fruits & Nuts', 'Medicinal Plants', 'Eco-friendly Crafts']).delete()
    Product.objects.filter(name__in=['Premium Teak Wood', 'Forest Honey', 'Cashew Nuts', 'Medicinal Bark Extract', 'Bamboo Crafts']).delete()


class Migration(migrations.Migration):

    dependencies = [
        ('department', '0012_seed_default_accounts'),
    ]

    operations = [
        migrations.RunPython(seed_sample_data, remove_sample_data),
    ]
