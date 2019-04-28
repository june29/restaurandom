var app = new Vue({
  el: '#app',
  data() {
    return {
      message: 'Hello Restaurandom!',
      shop: null,
      shops: []
    }
  },
  mounted() {
    axios
      .get('./shops.json')
      .then(response => {
        this.shops = response.data;
        this.pick();
      });
  },
  methods: {
    pick: function() {
      this.shop = _.sample(this.shops)
      console.log(this.shop.name);
    }
  }
});
