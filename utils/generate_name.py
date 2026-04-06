from faker import Faker

fake = Faker('pt_BR')

def generate_name():
    return f"{fake.first_name()} {fake.last_name()}"