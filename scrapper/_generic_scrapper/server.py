from typing import Union
from fastapi import FastAPI
from pydantic import BaseModel
from scrapper import scrapper

app = FastAPI()

class Store(BaseModel):
	url: str


@app.get("/ping")
def read_root():
	return {"status": "ok"}


@app.post("/test")
def read_item(store: Store):
	# print(store)
	test = scrapper("5601012004427", store.url)
	return test
