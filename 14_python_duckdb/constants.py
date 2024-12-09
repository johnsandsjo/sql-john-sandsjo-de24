from pathlib import Path


#__file_ dunder file gives the avsolute path to constants.py
# / "data" -> concatatenate with "data"
# / operator works here due to operator overloading and polymorphism

DATA_PATH = Path(__file__).parent / "data"
DATABASE_PATH = Path(__file__).parent /"goteborg_stad.db"
print(DATA_PATH)