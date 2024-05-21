import React, { useMemo, useRef, useState, useEffect } from "react";
import { router, Link } from "@inertiajs/react";
import dayjs from "dayjs";
import TextInput from "@/Components/TextInput";
import Checkbox from "@/Components/Checkbox";
import { AiOutlineLoading3Quarters } from "react-icons/ai";

const debounce = (mainFunction, delay) => {
    // Declare a variable called 'timer' to store the timer ID
    let timer;

    // Return an anonymous function that takes in any number of arguments
    return function (...args) {
        // Clear the previous timer to prevent the execution of 'mainFunction'
        clearTimeout(timer);

        // Set a new timer that will execute 'mainFunction' after the specified delay
        timer = setTimeout(() => {
            mainFunction(...args);
        }, delay);
    };
};

const useDebounce = (callback) => {
    const ref = useRef();

    useEffect(() => {
        ref.current = callback;
    }, [callback]);

    const debouncedCallback = useMemo(() => {
        const func = () => {
            ref.current?.();
        };

        return debounce(func, 300);
    }, []);

    return debouncedCallback;
};

export default function ProductsGrid({
    products,
    admin,
    query,
    querycapacity,
}) {
    const [searchName, setSearchName] = useState(query || "");
    const [loading, setLoading] = useState(false);

    function applyFilters() {
        router.get(
            "products",
            {
                query: searchName,
            },
            { preserveScroll: true, preserveState: true, replace: true }
        );
    }

    const debouncedRequest = useDebounce(() => {
        // send request to the backend
        // access to latest state here
        // console.log("debounced", searchName);
        applyFilters();
        setLoading(false);
    });

    const onChange = (e) => {
        setLoading(true);
        setSearchName(e.target.value);
        debouncedRequest();
    };

    return (
        <>
            <div className="flex flex-end items-center">
                <TextInput
                    id="search"
                    placeholder="Search"
                    value={searchName}
                    className="mt-1 block w-64 mr-2"
                    onChange={onChange}
                />

                {Boolean(loading) && (
                    <AiOutlineLoading3Quarters className="animate-spin inline-block" />
                )}
            </div>
            <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
                {products.map((product) => (
                    <Link
                        href={route("products.show", product.id)}
                        key={product.id}
                        className="flex flex-col text-center items-center p-4 sm:p-8 bg-white shadow rounded-lg"
                    >
                        <img className="max-h-[200px]" src={product.img} />
                        <div>
                            <p className="text-md font-bold mt-6">
                                {product.name}, {product.capacity}ml
                            </p>

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
