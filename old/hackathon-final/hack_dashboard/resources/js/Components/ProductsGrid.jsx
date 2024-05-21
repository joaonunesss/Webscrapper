import React, { useState, useEffect } from "react";
import { router, Link } from "@inertiajs/react";
import dayjs from "dayjs";
import TextInput from "@/Components/TextInput";
import Checkbox from "@/Components/Checkbox";

export default function ProductsGrid({
    products,
    admin,
    query,
    querycapacity,
}) {
    const [searchName, setSearchName] = useState(query ?? "");

    function applyFilters() {
        console.log("applying filters");
        router.get(
            "products",
            {
                query: searchName,
            },
            { preserveScroll: true }
        );
    }

    const handleKeyUp = (event) => {
        if (event.key === "Enter") {
            applyFilters();
        }
    };

    return (
        <>
            <div className="flex flex-end">
                <TextInput
                    id="search"
                    placeholder="Search"
                    value={searchName}
                    className="mt-1 block w-64"
                    onChange={(e) => setSearchName(e.target.value)}
                    onKeyUp={handleKeyUp}
                />
            </div>
            <div className="grid grid-cols-4 gap-4">
                {products.map((product) => (
                    <Link
                        href={route("products.show", product.id)}
                        key={product.id}
                        className="flex flex-col text-center items-center sm:p-8 bg-white shadow sm:rounded-lg"
                    >
                        <img className="max-h-42" src={product.img} />
                        <div>
                            <p className="text-md font-bold mt-6">
                                {product.name}, {product.capacity}ml
                            </p>

                            {product.harvest_year}

                            <p className="text-xs mt-2">EAN: {product.id}</p>
                        </div>
                    </Link>
                ))}
            </div>
        </>
    );
}

/*
<div className="relative overflow-x-auto shadow-md sm:rounded-lg">
            <table className="w-full text-sm text-left text-gray-500">
                
            </table>
        </div>
*/
