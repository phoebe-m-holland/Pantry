class ingredient:
  macro = {"fat":0, "protein":0, "carbohydrate":0, "fiber":0} #kcal
  micro = {}
  properties = ""
  #sections for vitamins, water, rare micro stuff, etc
  #add method sums nutrients and produces a recipe

class process:
  #functor class for doing stuff to ingredients.
  #returns an ingredient with possibly changed nutrient values,
  #e.g. baking removes some amount of some vitamin,
  #pressure cook/sous vide does not
  #this value could be changed as an approximate factor with error
  #it may

class recipe:
  #class to represent combined ingredients.
  #along with processes, hopefully order of operations should
  #represent recipe pretty well
