// Use path, express, handlebars, body-parser and mysql module
const path = require("path");
const express = require("express");
const hbs = require("hbs");
const bodyParser = require("body-parser");
const mysql = require("mysql");
const fileUpload = require("express-fileupload");

// Set app with express module
const app = express();

// Create connection to database
const conn = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "books_db",
  multipleStatements: true,
});

// Connecting to database
conn.connect((err) => {
  if (err) throw err;
  console.log("Connected to MySQL");
});

// Set view file
app.set("views", path.join(__dirname, "views"));
// Set view engine to hbs
app.set("view engine", "hbs");
// Set body parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
// Set public folder as static folder for static file
app.use("/assets", express.static(__dirname + "/public"));
// Set file-upload
app.use(fileUpload());

// Route for homepage
app.get("/", (req, res) => {
  let sql = [
    "SELECT book_tb.book_id, book_tb.book_name, category_tb.category_id ,category_tb.category_name, writer_tb.writer_id, writer_tb.writter_name, book_tb.publication_year, book_tb.img_url FROM book_tb INNER JOIN category_tb on book_tb.category_id = category_tb.category_id INNER JOIN writer_tb on book_tb.writer_id = writer_tb.writer_id ORDER BY book_tb.book_id DESC",
    "SELECT * FROM category_tb",
    "SELECT * FROM writer_tb",
  ];
  conn.query(sql.join(";"), (err, results, field) => {
    if (err) throw err;
    res.render("product_view", {
      books: results[0],
      category: results[1],
      writer: results[2],
    });
  });
});

// Route for post (insert) book data, if success, redirect to homepage ('/')
app.post("/saveBook", (req, res) => {
  let sampleFile, uploadPath;

  if (!req.files || Object.keys(req.files).length === 0) {
    return res.status(400).send("No files were uploaded.");
  }

  // name of the input is sampleFile
  sampleFile = req.files.sampleFile;
  uploadPath = `${__dirname}/public/img/${sampleFile.name}`;
  let sql = "INSERT INTO book_tb SET ?";
  let data = {
    book_name: req.body.book_name,
    category_id: Number(req.body.category_id),
    writer_id: Number(req.body.writer_id),
    publication_year: req.body.publication_year,
    img_url: sampleFile.name,
  };

  // Use mv() to place file on the server
  sampleFile.mv(uploadPath, (err) => {
    if (err) return res.send(err);
    conn.query(sql, data, (err, results) => {
      if (err) throw err;
      res.redirect("/");
    });
  });
});

// Route for post (insert) writer data, if success, redirect to homepage ('/')
app.post("/saveWriter", (req, res) => {
  let data = { writter_name: req.body.writer_name };
  let sql = "INSERT INTO writer_tb SET ?";
  conn.query(sql, data, (err, results) => {
    if (err) throw err;
    res.redirect("/");
  });
});

// Route for post (insert) category data, if success, redirect to homepage ('/')
app.post("/saveCategory", (req, res) => {
  let data = { category_name: req.body.category_name };
  let sql = "INSERT INTO category_tb SET ?";
  conn.query(sql, data, (err, results) => {
    if (err) throw err;
    res.redirect("/");
  });
});

// Route for update data, if success, redirect to homepage ('/')
app.post("/update", (req, res) => {
  let sampleFile, uploadPath;

  if (!req.files || Object.keys(req.files).length === 0) {
    return res.status(400).send("No files were uploaded.");
  }

  // name of the input is sampleFile
  sampleFile = req.files.sampleFile;
  uploadPath = `${__dirname}/public/img/${sampleFile.name}`;
  let book_id = req.body.book_id;
  let book_name = req.body.book_name;
  let category_id = Number(req.body.category_id);
  let writer_id = Number(req.body.writer_id);
  let publication_year = req.body.publication_year;
  let img_url = sampleFile.name;
  let sql = `UPDATE book_tb SET book_name='${book_name}', category_id=${category_id}, writer_id=${writer_id}, publication_year='${publication_year}', img_url='${img_url}' WHERE book_id=${book_id}`;

  // Use mv() to place file on the server
  sampleFile.mv(uploadPath, (err) => {
    if (err) return res.send(err);
    conn.query(sql, (err, results) => {
      if (err) throw err;
      res.redirect("/");
    });
  });
});

app.post("/delete", (req, res) => {
  let sql = `DELETE FROM book_tb WHERE book_id=${req.body.book_id}`;
  let query = conn.query(sql, (err, results) => {
    if (err) throw err;
    res.redirect("/");
  });
});

// Server listening at port 8085
app.listen(8085, () => {
  console.log("Server is running at port 8085");
  console.log("http://localhost:8085/");
});
