Sequel.migration do
  change do
    create_table(:users) do
      String       :provider
      String       :uid
      String       :name
    end
  end
end
