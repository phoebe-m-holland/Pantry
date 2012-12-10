from fuzzywuzzy.fuzz import token_set_ratio
from re import match
from buzhug import Base
from datetime import date, timedelta

fuzzFactor = 50
fuzzy = lambda field, key: token_set_ratio(key, field) >= fuzzFactor


class Food:
  def __init__(self, name, expiration, location, quantity, tags):
    """
      str, date, str, number, str -> Food object
    """
    self.name = unicode(name.title())
    self.expiration = expiration
    self.location = unicode(location)
    self.quantity = float(quantity)
    self.tags = unicode(tags)


class Pantry(Base):
  """
    Initialize a new Pantry object.
    If a database file exists and can be opened,
      opens it.
    Else,
      creates a new database with the right (empty) fields.
  """
  def __init__(self, filename):
    Base.__init__(self, filename)
    try:
      self.open()
    except IOError:
      self.create(("name", unicode),
                  ("expiration", date),
                  ("location", unicode),
                  ("quantity", float),
                  ("tags", unicode))

  def add(self, food):
    self.insert(food.name,
                food.expiration,
                food.location,
                food.quantity,
                food.tags)

  expiresIn = lambda self, days:\
      (r for r in self if r.expiration - date.today() <= timedelta(days))
  nameRegex = lambda self, key: (r for r in self if match(key, r.name))
  tagsRegex = lambda self, key: (r for r in self if match(key, r.tags))
  nameFuzzy = lambda self, key: (r for r in self if fuzzy(key, r.name))
  tagsFuzzy = lambda self, key: (r for r in self if fuzzy(key, r.tags))
