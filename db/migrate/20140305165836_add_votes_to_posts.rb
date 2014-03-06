# See http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html
Sequel.migration do
  change do
    # The changes we want to make to our database, e.g.,
    # adding a new string column to the posts table called "url"
    #
     add_column :posts, :votes, :integer, :default => 0
  end
end
