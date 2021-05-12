const express = require('express');
const asyncHandler = require('express-async-handler');

const router = express.Router();

const { getAll, getZutaten, getSmallerThan, deleteCocktail, addCocktail, updateCocktail } = require('../model');

router.get(
  '/cocktails/all',
  asyncHandler(async (req, res) => {
    let result;
    if (req.query.max) result = await getSmallerThan(req.query.max);
    else result = await getAll();
    res.status(result.code).send(result.data);
  }),
);

router.get(
  '/cocktails/:name/zutaten',
  asyncHandler(async (req, res) => {
    const result = await getZutaten(req.params.name);
    res.status(result.code).send(result.data);
  }),
);

router.delete(
  '/cocktails/:name',
  asyncHandler(async (req, res) => {
    const result = await deleteCocktail(req.params.name);
    res.status(result.code).send(result.data);
  }),
);

router.post(
  '/cocktails',
  asyncHandler(async (req, res) => {
    const result = await addCocktail(req.body);
    res.status(result.code).send(result.data);
  }),
);

router.patch(
  '/cocktails/:name',
  asyncHandler(async (req, res) => {
    const result = await updateCocktail(req.params.name, req.body.preis);
    res.status(result.code).send(result.data);
  }),
);

module.exports = router;
