const errorHandler = (err, req, res, next) => {
  console.log(`Error => ${err.message}`.red);
  res.status(500).json({
    code: 500,
    data: 'Server Error',
  });
};

const notFound = (req, res) => {
  console.log(`Not Found: ${err.message}`.red);
  res.status(500).json({
    code: 404,
    data: 'Not found',
  });
};

module.exports = { errorHandler, notFound };
