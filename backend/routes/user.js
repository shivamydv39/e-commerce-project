const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const User = require('../model/user');

// Get all users
router.get('/', asyncHandler(async (req, res) => {
    try {
        const users = await User.find();
        res.json({ success: true, message: "Users retrieved successfully.", data: users });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
}));

// login - updated to support email-based login
router.post('/login', async (req, res) => {
    const { email, password } = req.body;

    try {
        // Check if the user exists by email
        const user = await User.findOne({ email });

        if (!user) {
            return res.status(401).json({ success: false, message: "Invalid email or password." });
        }
        
        // Check if the password is correct
        if (user.password !== password) {
            return res.status(401).json({ success: false, message: "Invalid email or password." });
        }

        // Authentication successful
        res.status(200).json({ success: true, message: "Login successful.", data: user });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
});

// Get a user by ID
router.get('/:id', asyncHandler(async (req, res) => {
    try {
        const userID = req.params.id;
        const user = await User.findById(userID);
        if (!user) {
            return res.status(404).json({ success: false, message: "User not found." });
        }
        res.json({ success: true, message: "User retrieved successfully.", data: user });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
}));

// Create a new user
router.post('/register', asyncHandler(async (req, res) => {
    const { name, email, password } = req.body;
    if (!name || !email || !password) {
        return res.status(400).json({ success: false, message: "Name, email, and password are required." });
    }

    try {
        // Check if a user with this email already exists
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ success: false, message: "A user with this email already exists." });
        }

        const user = new User({ name, email, password });
        const newUser = await user.save();
        res.json({ success: true, message: "User created successfully.", data: null });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
}));

// Update a user
router.put('/:id', asyncHandler(async (req, res) => {
    try {
        const userID = req.params.id;
        const { name, email, password } = req.body;
        const updateData = {};
        
        // Only add fields that are provided
        if (name) updateData.name = name;
        if (email) updateData.email = email;
        if (password) updateData.password = password;
        
        if (Object.keys(updateData).length === 0) {
            return res.status(400).json({ success: false, message: "At least one field is required for update." });
        }

        const updatedUser = await User.findByIdAndUpdate(
            userID,
            updateData,
            { new: true }
        );

        if (!updatedUser) {
            return res.status(404).json({ success: false, message: "User not found." });
        }

        res.json({ success: true, message: "User updated successfully.", data: updatedUser });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
}));

// Delete a user
router.delete('/:id', asyncHandler(async (req, res) => {
    try {
        const userID = req.params.id;
        const deletedUser = await User.findByIdAndDelete(userID);
        if (!deletedUser) {
            return res.status(404).json({ success: false, message: "User not found." });
        }
        res.json({ success: true, message: "User deleted successfully." });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
}));

module.exports = router;