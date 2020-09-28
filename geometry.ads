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

    package Double_Text_IO is new Ada.Text_IO.Float_IO(double); use Double_Text_IO;

    package aPharos_Arrays is new Ada.Numerics.Generic_Real_Arrays(Real => double); 
    use aPharos_Arrays;

    type Point is new aPharos_Arrays.Real_Vector(index);

    type Vector is new aPharos_Arrays.Real_Vector(index);

    type Normal is new aPharos_Arrays.Real_Vector(index);

    ORIGIN : constant Point := (x => 0.0, y => 0.0, z => 0.0);

	-- Point functions
    function distance_squared(pointA : in Point; pointB : in Point) return double;

    function distance(pointA : in Point; pointB : in Point) return double;

    function linear_interpolate(time : in interpolate_time; pointA : in Point; pointB : in Point) return Point;

    function max (pointA : in Point; pointB : in Point) return Point;

    function min (pointA : in Point; pointB : in Point) return Point;

    function "+" (pointA : in Point; vectorA : in Vector) return Point; 

    function "-" (pointA : in Point; vectorA : in Vector) return Point;

    function floor (pointA : in Point) return Point;

    function ceiling (pointA : in Point) return Point;

    function image (pointA : in Point) return String;

	-- Vector functions

    function vector_from_points(from : in Point; to : in Point) return Vector;

    function "+" (vectorA : in Vector; normalA : in Normal) return Vector;

    function "-" (vectorA : in Vector; normalA : in Normal) return Vector;

    function magnitude(vectorA : in Vector) return double;

    function normalize(vectorA : in Vector) return Vector;

    function dot(vectorA : in Vector; vectorB : in Vector) return double;

    function dot(vectorA : in Vector; normalA : in Normal) return double;

	function angle_between(vectorA : in Vector; vectorB : in Vector) return double;

	function orthogonal(vectorA : in Vector; vectorB : in Vector) return boolean;

	function cross(vectorA : in Vector; vectorB : in Vector) return Vector;

	function inverse(vectorA : in Vector) return Vector;	

    function image (vectorA : in Vector) return String;

	-- Normal functions

	function normal_from_points (from : in Point; to : in Point) return Normal;

	function normal_from_vector (vectorA : in Vector) return Normal;

	function "+" (normalA : in Normal; vectorA : in Vector) return Vector;

	function "-" (normalA : in Normal; vectorA : in Vector) return Vector;

	function magnitude(normalA : in Normal) return double;

	function normalize(normalA : in Normal) return Normal;

	function dot(normalA : in Normal; vectorA : in Vector) return double;

	function orthogonal(normalA : in Normal; vectorA : in Vector) return boolean;

	function cross(normalA : in Normal; vectorA : in Vector) return Vector;

	function inverse(normalA : in Normal) return Normal;

	function to_vector(normalA : in Normal) return Vector;

	function image(normalA : in Normal) return String;

end Geometry;
