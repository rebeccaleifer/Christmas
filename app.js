let express = require("express");
let app = new express();

app.use(express.static(__dirname + '/public'));

// Initialize database connection
const knex = require("knex")({
    client: "mysql",
    connection: {
        host: "christmasdb.cluster-cyojq0o6xjnw.us-west-1.rds.amazonaws.com",
        user: "admin",
        password: "adminadmin",
        database: "Christmas",
        port: 3306,
    },
});

app.get("/", (req,res) => {
    knex
    .select()
    .from("Costumes")
    .then((result) => {
        res.render("index.ejs", {aCostumes: result});
    });
});

app.get("/about.html", (req, res) => {
    res.render("about.ejs");
});

app.get("/index.html", (req,res) => {
    res.redirect("/");
})
app.listen(8080);