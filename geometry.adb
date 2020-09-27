-- aPharos is a simple Ada-based Ray Tracer.
-- Copyright (c) 2020.   Richard Scott McNew
--
-- aPharos is free software: you can redistribute it and / or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

with Ada.Numerics.Long_Elementary_Functions; use Ada.Numerics.Long_Elementary_Functions;

package body Geometry is

    function distance_squared(pointA : in Point; pointB : in Point) return double is
    begin
        return (pointA(x) - pointB(x))**2 + (pointA(y) - pointB(y))**2 + (pointA(z) - pointB(z))**2;
    end distance_squared;

    function distance(pointA : in Point; pointB : in Point) return double is
    begin
        return Sqrt(distance_squared(pointA, pointB));
    end distance;
    
    function linear_interpolate(time : in interpolate_time; pointA : in Point; pointB : in Point) return Point is
    begin
        return (pointA * (1.0-time)) + (pointB * time); 
    end linear_interpolate;

    function max (pointA : in Point; pointB : in Point) return Point is
        retVal : Point := (x => max(pointA(x), pointB(x)), y => max(pointA(y), pointB(y)), z => max(pointA(z), pointB(z)));
    begin
        return retVal;
    end max;

    function min (pointA : in Point; pointB : in Point) return Point is
        retVal : Point := (x => min(pointA(x), pointB(x)), y => min(pointA(y), pointB(y)), z => min(pointA(z), pointB(z)));
    begin
        return retVal;
    end min;

    function "+" (pointA : in Point; vectorA : in Vector) return Point is 
        retVal : Point := (x => (pointA(x) + vectorA(x)), y => (pointA(y) + vectorA(y)), z => (pointA(z) + vectorA(z)) );
    begin
        return retVal;
    end "+";

    function "-" (pointA : in Point; vectorA : in Vector) return Point is
        retVal : Point := (x => pointA(x) - vectorA(x), y => pointA(y) - vectorA(y), z => pointA(z) - vectorA(z));
    begin
        return retVal;
    end "-";

    function floor (pointA : in Point) return Point is
        retVal : Point := (x => (pointA(x)) , y => (pointA(y)) , z => (pointA(z)) );
    begin
        return retVal;
    end floor;

    function ceiling (pointA : in Point) return Point is
        retVal : Point := (x => (pointA(x)) , y => (pointA(y)) , z => (pointA(z)) );
    begin
        return retVal;
    end ceiling;

    function image (pointA : in Point) return String is
    begin
        return "Point (x => " & double'Image(pointA(x)) & ", y => " & double'Image(pointA(y)) & ", z => " & double'Image(pointA(z)) & ")";
    end image;

    function vector_from_points(from : in Point; to : in Point) return Vector is
        retVal : Vector := (x => (to(x) - from(x)), y => (to(y) - from(y)), z => (to(z) - from(z)) ); 
    begin
        return retVal;
    end vector_from_points;

    function "+" (vectorA : in Vector; normalA : in Normal) return Vector is
        retVal : Vector := (x => vectorA(x) + normalA(x), y => vectorA(y) + normalA(y), z => vectorA(z) + normalA(z) );
    begin
        return retVal;
    end "+";

    function "-" (vectorA : in Vector; normalA : in Normal) return Vector is
        retVal : Vector := (x => vectorA(x) - normalA(x), y => vectorA(y) - normalA(y), z => vectorA(z) - normalA(z) );
    begin
        return retVal;
    end "-";

    function magnitude(vectorA : in Vector) return double is
        retVal : double := Sqrt(vectorA(x)**2 + vectorA(y)**2 + vectorA(z)**2);
    begin
        return retVal;
    end magnitude;

    function normalize(vectorA : in Vector) return Vector is
        mag : double := magnitude(vectorA);
        retVal : Vector := (x => vectorA(x)/mag, y => vectorA(y)/mag, z => vectorA(z)/mag);
    begin
        return retVal;
    end normalize;

    function dot(vectorA : in Vector; vectorB : in Vector) return double is
        retVal : double := (vectorA(x) * vectorB(x)) + (vectorA(y) * vectorB(y)) + (vectorA(z) * vectorB(z));
    begin
        return retVal;
    end dot;

    function dot(vectorA : in Vector; normalA : in Normal) return double is 
        retVal : double := (vectorA(x) * normalA(x)) + (vectorA(y) * normalA(y)) + (vectorA(z) * normalA(z));
    begin
        return retVal;
    end dot;

	function angle_between(vectorA : in Vector; vectorB : in Vector) return double is
		retVal : double := arccos( dot(vectorA, vectorB) / (magnitude(vectorA) * magnitude(vectorB)) );
	begin
		return retVal;
	end angle_between;

	function is_orthogonal(vectorA : in Vector; vectorB : in Vector) return boolean is
		retVal : boolean := dot(vectorA, vectorB) = 0.0;
	begin
		return retVal;
	end is_orthogonal;

	function cross(vectorA : in Vector; vectorB : in Vector) return Vector is
		retVal : Vector := (x => (vectorA(y) * vectorB(z) - vectorA(z) * vectorB(y)), 
							y => (vectorA(z) * vectorB(x) - vectorA(x) * vectorB(z)), 
							z => (vectorA(x) * vectorB(y) - vectorA(y) * vectorB(x)));
	begin
		return retVal;
	end cross;

	function inverse(vectorA : in Vector) return Vector is
		retVal : Vector := (x => -vectorA(x), y => -vectorA(y), z => -vectorA(z));
	begin
		return retVal;
	end inverse;

    function image (vectorA : in Vector) return String is
    begin
        return "Vector (x => " & double'Image(vectorA(x)) & ", y => " & double'Image(vectorA(y)) & ", z => " & double'Image(vectorA(z)) & ")";
    end image;


end Geometry;
