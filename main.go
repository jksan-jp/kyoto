package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	e := echo.New()

	e.HideBanner = true

	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	e.GET("/status", func(c echo.Context) error {
		return c.JSON(http.StatusOK, "OK")
	})

	e.Start(":8080")
}
