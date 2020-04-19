//- Crud
    
//sorting
selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)

//save
func save(category: Category) {
    do {
        try realm.write {
            realm.add(category)
        }
    } catch {
        print("Error saving category \(error)")
    }
    tableView.reloadData()
}

func updateModel(at indexPath: IndexPath) {
    if let categoryForDeletion = self.categories?[indexPath.row] {
        do {
            try self.realm.write {
                self.realm.delete(categoryForDeletion)
            }
        } catch {
            print("Error deleting category, \(error)")
        }
    }
}