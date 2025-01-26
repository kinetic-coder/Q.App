class KitItem:
    def __init__(self, tenant_id, name, category, quantity, unit, condition, notes, estimated_unit_value, purchase_date, purchase_price, location, estimated_life_span, estimated_replacement_date):
        self.name = name
        self.category = category
        self.quantity = quantity
        self.unit = unit
        self.condition = condition
        self.notes = notes
        self.estimated_unit_value = estimated_unit_value
        self.purchase_date = purchase_date
        self.purchase_price = purchase_price
        self.location = location
        self.estimated_list_span = estimated_life_span
        self.estimated_replacement_date = estimated_replacement_date
        self.estimated_insurance_value = estimated_unit_value
        self.kit_code = ""
        self.tenant_id = tenant_id
        self.description = name
        self.nickname = name

    def __repr__(self):
        return f"KitItem(name={self.name}, quantity={self.quantity})"
    