const mongoose = require('mongoose');
const bcrypt = require('bcrypt');

const userSchema = new mongoose.Schema({
  email: {
    type: String,
    required: [true, 'Email is required'],
    unique: true,
    lowercase: true,
    trim: true,
    match: [/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, 'Please enter a valid email']
  },
  passwordHash: {
    type: String,
    required: [true, 'Password is required']
  },
  profile: {
    firstName: {
      type: String,
      required: [true, 'First name is required'],
      trim: true
    },
    lastName: {
      type: String,
      required: [true, 'Last name is required'],
      trim: true
    },
    age: {
      type: Number,
      min: [1, 'Age must be at least 1'],
      max: [120, 'Age must be less than 120']
    },
    gender: {
      type: String,
      enum: ['Male', 'Female', 'Other']
    },
    phone: {
      type: String,
      trim: true,
      validate: {
        validator: function(v) {
          return !v || /^[0-9]{10}$/.test(v);
        },
        message: 'Please enter a valid 10-digit phone number'
      }
    },
    state: {
      type: String
    },
    district: {
      type: String
    }
  },
  medicalHistory: [{
    disease: {
      type: String,
      required: true
    },
    diagnosedDate: {
      type: Date,
      required: true
    },
    notes: String
  }],
  allergies: [String],
  preferences: {
    language: {
      type: String,
      default: 'en',
      enum: ['en', 'hi', 'or', 'ta', 'kn', 'ml', 'mr']
    },
    notifications: {
      type: Boolean,
      default: true
    }
  },
  refreshTokens: [{
    token: String,
    expiresAt: Date
  }],
  role: {
    type: String,
    enum: ['user', 'doctor', 'admin'],
    default: 'user'
  }
}, {
  timestamps: true
});

// Virtual field for full name
userSchema.virtual('profile.fullName').get(function() {
  return `${this.profile.firstName} ${this.profile.lastName}`;
});

// Pre-save hook for password hashing
userSchema.pre('save', async function(next) {
  if (!this.isModified('passwordHash')) {
    return next();
  }
  try {
    const salt = await bcrypt.genSalt(10);
    this.passwordHash = await bcrypt.hash(this.passwordHash, salt);
    next();
  } catch (error) {
    next(error);
  }
});

// Method to compare password
userSchema.methods.comparePassword = async function(candidatePassword) {
  return await bcrypt.compare(candidatePassword, this.passwordHash);
};

// Index for email lookup
userSchema.index({ email: 1 });

module.exports = mongoose.model('User', userSchema);
