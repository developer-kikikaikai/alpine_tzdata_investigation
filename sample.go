package main

import (
	"fmt"
	"time"
)

func main() {
	loc, err := time.LoadLocation("Asia/Tokyo")
	if err != nil {
		fmt.Printf("time.LoadLocation error:%s\n", err.Error())
		return
	}
	basetime, err := time.Parse(time.RFC3339, "2020-11-07T15:04:05Z")
	if err != nil {
		fmt.Printf("time.Parse error:%s\n", err.Error())
		return
	}
	fmt.Printf("base time: %s is converting to JST\n", basetime.String())
	jsttime := basetime.In(loc)
	fmt.Printf("converted to %s\n", jsttime.String())
	if "2020-11-08 00:04:05 +0900 JST" != jsttime.String() {
		fmt.Printf("JST Convert failed!!\n")
		return
	}
	fmt.Printf("jsttime convert successful!\n")
}
