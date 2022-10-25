﻿// The MIT License(MIT)
//
// Copyright(c) 2021 Alberto Rodriguez Orozco & LiveCharts Contributors
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

using System;
using LiveChartsCore.Drawing;
using LiveChartsCore.Measure;

namespace LiveChartsCore.Kernel.Drawing;

/// <summary>
/// Defines a rectangle hover area.
/// </summary>
/// <seealso cref="HoverArea" />
public class RectangleHoverArea : HoverArea
{
    /// <summary>
    /// Initializes a new instance of the <see cref="RectangleHoverArea"/> class.
    /// </summary>
    public RectangleHoverArea() { }

    /// <summary>
    /// Initializes a new instance of the <see cref="RectangleHoverArea"/> class.
    /// </summary>
    /// <param name="x">The x.</param>
    /// <param name="y">The y.</param>
    /// <param name="width">The width.</param>
    /// <param name="height">The height.</param>
    public RectangleHoverArea(float x, float y, float width, float height)
    {
        X = x;
        Y = y;
        Width = width;
        Height = height;
    }

    /// <summary>
    /// Gets or sets the x location.
    /// </summary>
    /// <value>
    /// The x.
    /// </value>
    public float X { get; set; }

    /// <summary>
    /// Gets or sets the y location.
    /// </summary>
    /// <value>
    /// The y.
    /// </value>
    public float Y { get; set; }

    /// <summary>
    /// Gets or sets the width.
    /// </summary>
    /// <value>
    /// The width.
    /// </value>
    public float Width { get; set; }

    /// <summary>
    /// Gets or sets the height.
    /// </summary>
    /// <value>
    /// The height.
    /// </value>
    public float Height { get; set; }

    /// <summary>
    /// Sets the area dimensions.
    /// </summary>
    /// <param name="x">The x.</param>
    /// <param name="y">The y.</param>
    /// <param name="width">The width.</param>
    /// <param name="height">The height.</param>
    /// <returns></returns>
    public RectangleHoverArea SetDimensions(float x, float y, float width, float height)
    {
        X = x;
        Y = y;
        Width = width;
        Height = height;
        return this;
    }

    /// <inheritdoc cref="HoverArea.DistanceTo(LvcPoint)"/>
    public override double DistanceTo(LvcPoint point)
    {
        var cx = X + Width * 0.5;
        var cy = Y + Height * 0.5;

        return Math.Sqrt(Math.Pow(point.X - cx, 2) + Math.Pow(point.Y - cy, 2));
    }

    /// <inheritdoc cref="HoverArea.IsPointerOver(LvcPoint, TooltipFindingStrategy)"/>
    public override bool IsPointerOver(LvcPoint pointerLocation, TooltipFindingStrategy strategy)
    {
        // at least one pixel to fire the tooltip.
        var w = Width < 1 ? 1 : Width;
        var h = Height < 1 ? 1 : Height;

        var isInX = pointerLocation.X > X && pointerLocation.X < X + w;
        var isInY = pointerLocation.Y > Y && pointerLocation.Y < Y + h;

        return strategy switch
        {
            TooltipFindingStrategy.CompareOnlyX or TooltipFindingStrategy.CompareOnlyXTakeClosest => isInX,
            TooltipFindingStrategy.CompareOnlyY or TooltipFindingStrategy.CompareOnlyYTakeClosest => isInY,
            TooltipFindingStrategy.CompareAll or TooltipFindingStrategy.CompareAllTakeClosest => isInX && isInY,
            TooltipFindingStrategy.Automatic => throw new Exception($"The strategy {strategy} is not supported."),
            _ => throw new NotImplementedException()
        };
    }

    /// <inheritdoc cref="HoverArea.SuggestTooltipPlacement(TooltipPlacementContext)"/>
    public override void SuggestTooltipPlacement(TooltipPlacementContext cartesianContext)
    {
        if (Y < cartesianContext.MostTop) cartesianContext.MostTop = Y;
        if (Y + Height > cartesianContext.MostBottom) cartesianContext.MostBottom = Y + Height;
        if (X + Width > cartesianContext.MostRight) cartesianContext.MostRight = X + Width;
        if (X < cartesianContext.MostLeft) cartesianContext.MostLeft = X;
    }
}
