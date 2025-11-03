const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');
const { verifyToken } = require('../middleware/authMiddleware');
const { body } = require('express-validator');

// Validation middleware
const registerValidation = [
  body('email').isEmail().normalizeEmail(),
  body('password').isLength({ min: 6 }).withMessage('Password must be at least 6 characters'),
  body('profile.firstName').notEmpty().trim(),
  body('profile.lastName').notEmpty().trim(),
  body('profile.age').optional().isInt({ min: 1, max: 120 }),
  body('profile.gender').optional().isIn(['Male', 'Female', 'Other']),
  body('profile.state').optional().trim(),
  body('profile.district').optional().trim(),
  body('profile.phone').optional().matches(/^[0-9]{10}$/).withMessage('Phone must be 10 digits')
];

const loginValidation = [
  body('email').isEmail().normalizeEmail(),
  body('password').notEmpty()
];

// Routes
router.post('/register', registerValidation, authController.registerUser);
router.post('/login', loginValidation, authController.loginUser);
router.post('/refresh', authController.refreshToken);
router.post('/logout', verifyToken, authController.logoutUser);
router.get('/me', verifyToken, authController.getCurrentUser);

module.exports = router;
