(function(){
  'use strict';

  describe('GraphScale', function(){
    var GraphScale, subject;

    beforeEach(function(){
      GraphScale = growstuff.GraphScale;
      var bars = [
        {name: 'Shade', value: 0.2},
        {name: 'Half Shade', value: 0.5}
      ];
      var data = {
        bars: bars,
        width: {size: 300, scale: 'linear'},
        height: {size: 400, scale: 'ordinal'}
      };


      subject = new GraphScale(data, 'width');
      subject.render(d3.select('#jasmine_content').append('svg'));
    });


    it ('gets the values of all the bars', function(){
      expect(subject.getBarValues()).toEqual([0.2, 0.5]);
    });

  });

})();