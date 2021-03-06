const db = require('../util/database');

module.exports = class Grocery {
  constructor(id, status, descricao, estoque_min, estoque_max) {
    this.id = id;
    this.status = status;
    this.descricao = descricao;
    this.estoque_min = estoque_min;
    this.estoque_max = estoque_max;
  }

  static fetchAll() {
    return db.execute('SELECT * FROM produtos ORDER BY descricao');
  }

  static get(id) {
    return db.execute('SELECT * FROM produtos WHERE id = ?', [id]);
  }

  static post(status, descricao, estoque_min, estoque_max) {
    return db.execute('INSERT INTO produtos (status, descricao, estoque_min, estoque_max) VALUES (?, ?, ?, ?)', [status, descricao, estoque_min, estoque_max]);
  }

  static update(id, status, descricao, estoque_min, estoque_max) {
    return db.execute('UPDATE produtos SET status = ?, descricao = ?, estoque_min = ?, estoque_max = ? WHERE id = ?', [status, descricao, estoque_min, estoque_max, id]);
  }

  static delete(id) {
    return db.execute('DELETE FROM produtos WHERE id = ?', [id]);
  }
};
