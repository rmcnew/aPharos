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

with Ada.Numerics.Generic_Real_Arrays; 
with Ada.Text_IO;
with Numbers; use Numbers;

package Geometry is

    package aPharos_Arrays is new Ada.Numerics.Generic_Real_Arrays(Real => double); 
    use aPharos_Arrays;

    subtype Point is aPharos_Arrays.Real_Vector(index);

    package double_Text_IO is new Ada.Text_IO.Float_IO(double); use double_Text_IO;

    subtype Vector is aPharos_Arrays.Real_Vector(index);

    function distance_squared(pointA : in Point; pointB : in Point) return double;

    function distance(pointA : in Point; pointB : in Point) return double;

    function linear_interpolate(time : in interpolate_time; pointA : in Point; pointB : in Point) return Point;

    function max (pointA : in Point; pointB : in Point) return Point;

    function min (pointA : in Point; pointB : in Point) return Point;

    function plus (pointA : in Point; vectorA : in Vector) return Point; 

    function minus (pointA : in Point; vectorA : in Vector) return Point;

    function floor (pointA : in Point) return Point;

    function ceiling (pointA : in Point) return Point;

    function image (pointA : in Point) return String;

    ORIGIN : constant Point := (x => 0.0, y => 0.0, z => 0.0);

    function vector_from_points(from : in Point; to : in Point) return Vector;

end Geometry;
