import random
import string

def Generate_Email():
    nome = ''.join(random.choices(string.ascii_lowercase, k=8))
    numero = random.randint(100, 999)
    
    return f"{nome}{numero}@tuamaeaquelaursa.com"

print(Generate_Email())