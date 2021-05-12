const db = require('../db');

async function getAll() {
  const { rows } = await db.query('SELECT cname, preis FROM cocktail');
  return {
    data: rows,
    code: 200,
  };
}
async function getSmallerThan(preis) {
  const { rows } = await db.query('SELECT cname, preis FROM cocktail WHERE preis < $1', [preis]);
  return {
    data: rows,
    code: 200,
  };
}

async function getZutaten(name) {
  const { rows } = await db.query(
    'SELECT zbez FROM cocktail JOIN besteht USING(cid) JOIN zutat USING(zid) WHERE cname = $1',
    [name],
  );
  return {
    data: rows.map((el) => el.zbez),
    code: 200,
  };
}

async function deleteCocktail(name) {
  const { rows } = await db.query('DELETE FROM cocktail WHERE cname = $1 RETURNING cname', [name]);
  if (rows.length == 0)
    return {
      data: `Cocktail ${name} not found!`,
      code: 404,
    };
  else
    return {
      data: `Deleted ${name}`,
      code: 200,
    };
}

module.exports = { getAll, getZutaten, getSmallerThan, deleteCocktail };
