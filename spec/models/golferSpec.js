describe("App.Golfer", function() {
  describe("cost", function() {
    var golfer;

    beforeEach(function() {
      golfer = App.Golfer.createRecord();
    });

    it("should be 20 pts when rank is 1 - 15", function() {
      golfer.set('rank', 1);
      expect(golfer.get('cost')).toEqual(20);

      golfer.set('rank', 15);
      expect(golfer.get('cost')).toEqual(20);
    });

    it("should be 15 pts when rank is 16 - 30", function() {
      golfer.set('rank', 16);
      expect(golfer.get('cost')).toEqual(15);

      golfer.set('rank', 30);
      expect(golfer.get('cost')).toEqual(15);
    });

    it("should be 10 pts when rank is 31 - 45", function() {
      golfer.set('rank', 31);
      expect(golfer.get('cost')).toEqual(10);

      golfer.set('rank', 45);
      expect(golfer.get('cost')).toEqual(10);
    });

    it("should be 5 pts when rank is > 45", function() {
      golfer.set('rank', 46);
      expect(golfer.get('cost')).toEqual(5);

      golfer.set('rank', 100);
      expect(golfer.get('cost')).toEqual(5);
    });
  });
});
