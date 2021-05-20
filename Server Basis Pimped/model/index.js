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
  const cocktail = await db.query('SELECT cid FROM cocktail WHERE cname = $1', [name]);
  await db.query('DELETE FROM besteht WHERE cid = $1', [cocktail.rows[0].cid]);
  await db.query('DELETE FROM bestellt WHERE cid = $1', [cocktail.rows[0].cid]);

  const { rows } = await db.query('DELETE FROM cocktail WHERE cid = $1 RETURNING cname', [
    cocktail.rows[0].cid,
  ]);
  if (rows.length === 0) {
    return {
      data: `Cocktail ${name} not found!`,
      code: 404,
    };
  }
  return {
    data: `Deleted ${name}`,
    code: 200,
  };
}

async function addCocktail(params) {
  const { rows } = await db.query(
    'INSERT INTO cocktail(cname, preis, zubereitung, kid, zgid, sgid) VALUES ($1, $2, $3, $4, $5, $6) RETURNING cid',
    [params.cname, params.preis, params.zubereitung, params.kid, params.zgid, params.sgid],
  );
  return {
    data: `Inserted CID ${rows[0].cid}`,
    code: 200,
  };
}

async function updateCocktail(name, preis) {
  const { rows } = await db.query('UPDATE cocktail SET preis = $1 WHERE cname = $2 RETURNING cname, preis', [
    preis,
    name,
  ]);
  return {
    data: `Updated ${rows[0].cname} to ${rows[0].preis}`,
    code: 200,
  };
}

module.exports = {
  getAll,
  getZutaten,
  getSmallerThan,
  deleteCocktail,
  addCocktail,
  updateCocktail,
};
