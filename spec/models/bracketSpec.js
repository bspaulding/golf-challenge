describe("App.Bracket", function() {
  describe("spent", function() {
    it("should be the total of the golfer's costs", function() {
      var bracket = App.Bracket.createRecord();
      var golfers = bracket.get('golfers');
      golfers.addObject(App.Golfer.createRecord({ rank: 1 }));
      golfers.addObject(App.Golfer.createRecord({ rank: 1 }));

      expect(bracket.get('spent')).toEqual(40);
    });
  });
});
