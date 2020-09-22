with Numbers; use Numbers;

package Point is

    type Point is record
        x : double;
        y : double;
        z : double;
    end record;

    function distance_squared(pointA : in Point; pointB : in Point) return double;

    function distance(pointA : in Point; pointB : in Point) return double;

    function linear_interpolate(time : in double; pointA : in Point; pointB : in Point) return Point;

    function max (pointA : in Point; pointB : in Point) return Point;

    function min (pointA : in Point; pointB : in Point) return Point;

    function plus (pointA : in Point; pointB : in Point) return Point;

    -- plus vector
    
    -- minus vector

    -- times scalar

    function floor (pointA : in Point) return Point;

    function ceiling (pointA : in Point) return Point;

    function absolute_value (pointA : in Point) return Point;

    function image (pointA : in Point) return String;

end Point;
