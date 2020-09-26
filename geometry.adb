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

    function plus (pointA : in Point; vectorA : in Vector) return Point is 
        retVal : Point := (x => (pointA(x) + vectorA(x)), y => (pointA(y) + vectorA(y)), z => (pointA(z) + vectorA(z)) );
    begin
        return retVal;
    end plus;

    function minus (pointA : in Point; vectorA : in Vector) return Point is
        retVal : Point := (x => pointA(x) - vectorA(x), y => pointA(y) - vectorA(y), z => pointA(z) - vectorA(z));
    begin
        return retVal;
    end minus;

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


end Geometry;
