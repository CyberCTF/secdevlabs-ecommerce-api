// Written for this lab: the script upstream's app/scripts/generate-passwords.sh generates at
// `make install`, with the fixed user and password baked into build/api/Dockerfile.
var db = connect("mongodb://localhost/DB");
db.createUser(
    {
        user: "User20218841",
        pwd: "Pass11973052",
        roles: [{ role: "userAdminAnyDatabase", db: "admin" }]
    }
);
