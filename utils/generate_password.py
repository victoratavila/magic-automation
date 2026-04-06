import random
import string

def Generate_Password():
    senha = [
        random.choice(string.ascii_lowercase),
        random.choice(string.ascii_uppercase),
        random.choice(string.digits),
        random.choice(string.punctuation)
    ]
    
    caracteres = string.ascii_letters + string.digits + string.punctuation
    senha += random.choices(caracteres, k=8)
    
    random.shuffle(senha)
    return ''.join(senha)

print(Generate_Password())