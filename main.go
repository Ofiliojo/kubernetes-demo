package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"time"
)

func main() {
	launched := time.Now()
	router := gin.Default()
	router.GET("/greeting", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message":  "Hey Friends!",
			"launched": launched,
		})
	})
	router.Run()
}