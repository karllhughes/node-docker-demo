module.exports = function (sequelize, Sequelize) {
  return sequelize.define('college', {
    name: Sequelize.STRING,
  }, {
    createdAt: 'created_at',
    updatedAt: 'updated_at',
  });
};
